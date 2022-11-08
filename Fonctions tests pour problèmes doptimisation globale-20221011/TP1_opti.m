%Appels fonction
fun1 = @carromtable;
[dims1,lb1,ub1,solution1,minimum1] = fun1();



%Paramétrage options optimisation
fun1 = @carromtable;
[dims1,lb1,ub1,solution1,minimum1] = fun1();
x0 = [0 0];
A = [];
b = [];
Aeq=[];
beq=[];


%Paramétrage du problème
probleme =  createOptimProblem('fmincon','objective',fun1 , 'x0', X0,'Aineq', A, 'bineq', b, 'Aeq', Aeq, 'beq', beq, 'lb', lb1,'ub',ub1);


% %Appel GLobalSearch
% [x,fval,exitflag,output,solutions]=run(GlobalSearch,probleme);
% disp(x);
% disp(solutions);
% disp(fval);
% disp(output);


% %Multistart
% k = 100;
% [x,fval,exitflag,output,solutions]=run(MultiStart,probleme,k);


%Recuit 
options = optimoptions('simulannealbnd');
[x,fval,exitflag,output] = simulannealbnd(fun1,x0,lb1,ub1,options)

%Paramétrage pour affichage
x1 = lb1(1):0.1:ub1(1);
y1 = lb1(2):0.1:ub1(2);
[X1,Y1] = meshgrid(x1,y1);
anon_test=@(x1,y1) -((cos(x1).*cos(y1).*exp(abs(1 - sqrt(x1.^2 + y1.^2)/pi))).^2)/30;
Z1 = anon_test(X1,Y1);

figure(1)
contour(X1,Y1,Z1,30);
figure(2) 
surf(X1,Y1,Z1); 
figure;
options.PlotFcn = {"saplotbestf","saplotbestf ","saplotbestx","saplotf","saplotstopping","saplottemperature"};