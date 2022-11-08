% %Appels fonction
% fun1 = @carromtable;
% [dims1,lb1,ub1,solution1,minimum1] = fun1()
% x1 = lb1(1):0.1:ub1(1);
% y1 = lb1(2):0.1:ub1(2);
% [X1,Y1] = meshgrid(x1,y1);
% anon_test=@(x1,y1) -((cos(x1).*cos(y1).*exp(abs(1 - sqrt(x1.^2 + y1.^2)/pi))).^2)/30;
% Z1 = anon_test(X1,Y1);
% options = optimoptions('particleswarm');
% n = 15;
% [x,fval,exitflag,output] = particleswarm(fun1,n,lb1,ub1,options);
% figure(1)
% contour(X1,Y1,Z1,30);
% hold on
% scatter(x(1),x(2),'red','x')
% hold off
% figure(2) 
% surf(X1,Y1,Z1); 
% figure;
reps = 102
tic;
sorties_abscisse=zeros(1,150);
sorties_ordonnees=zeros(1,150);
n = 2;
taillessaim = [10 20 30 40 50 60 70 80 90 100]
options = optimoptions('particleswarm')
for i=1:150
    options.SwarmSize = taillessaim(i)
    tstart = tic;
    [x,fval,exitflag,output] = particleswarm(fun1,n,lb1,ub1,options);
    output
    telapsed = toc(tstart);
    sorties_abscisse(i) = x(1);
    sorties_ordonnees(i) = x(2);
end
averagetime = toc/reps
precision = []

sorties_ordonnees
sorties_abscisse

