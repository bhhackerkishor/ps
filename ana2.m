clc;
clear all;

n = input('Enter the number of generating units');

for i = 1:n
    disp('Enter the details for the unit');
    disp(i);
    a(i) = input('Enter the coefficient of Pg^2: ');
    b(i) = input('Enter the coefficient of Pg: ');
    pmin(i) = input('Enter the pmin value: ');
    pmax(i) = input('Enter the pmax value: ');
end

pd = input('Enter the demand value: ');
lam = input('Enter the starting value of lambda: ');
delp = 1;
iteration = 0;

q = input('Enter 1 for ED without losses & 2 for ED with losses: ');

if q == 1
    % -------- WITHOUT LOSSES --------
    while delp ~= 0
        pp = 0;
        x = 0;

        for i = 1:n
            p(i) = (lam - b(i)) / (2 * a(i));

            if p(i) < pmin(i)
                p(i) = pmin(i);
            end

            if p(i) > pmax(i)
                p(i) = pmax(i);
            end

            x = x + (1 / (2 * a(i)));
            pp = pp + p(i);
        end

        delp = pd - pp;
        delam = delp / x;
        lam = lam + delam;

        iteration = iteration + 1;

        if iteration == 5
            break;
        end
         disp('Iteration=');
    disp(iteration);
    disp('Power of the unit:');
    disp(p);
    disp('Lambda=');
    disp(lam);
    end

   

else
    % -------- WITH LOSSES --------
    for i = 1:n
        for j = 1:n
            B(i,j) = input('Enter the value: ');
        end
    end

    while delp ~= 0
        pp = 0;
        x = 0;
        ploss = 0;

        for i = 1:n
            p(i) = (lam - b(i)) / (2 * (a(i) + lam * B(i,i)));

            if p(i) < pmin(i)
                p(i) = pmin(i);
            end

            if p(i) > pmax(i)
                p(i) = pmax(i);
            end

            pp = pp + p(i);
            x = x + (1 / (2 * (a(i) + lam * B(i,i))));
        end

        ploss = p * B * transpose(p);

        delp = pd + ploss - pp;
        delam = delp / x;
        lam = lam + delam;

        iteration = iteration + 1;

        if iteration == 5
            break;
        end
    end

    disp('Iteration=');
    disp(iteration);
    disp('Power of the unit:');
    disp(p);
    disp('Lambda=');
    disp(lam);
end