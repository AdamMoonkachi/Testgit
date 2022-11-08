function varargout = easom(X)
% Easom function
%
%   EASOM([x1, x2]) returns the value of the Easom function at the
%   specified points. [x1] and [x2] may be vectors. The search
%   domain is
%
%               -100 < x_i < 100
%
%   The global minimum is
%
%               f(x1, x2) = f(pi, pi) = -1.


% Please report bugs and inquiries to:
%
% Name   : Rody P.S. Oldenhuis
% E-mail : oldenhuis@gmail.com
% Licence: 2-clause BSD (See Licence.txt)


% If you find this work useful, please consider a donation:
% https://www.paypal.me/RodyO/3.5


    % if no input is given, return dimensions, bounds and minimum
    if (nargin == 0)
        varargout{1} = 2;  % # dims
        varargout{2} = [-100, -100]; % LB
        varargout{3} = [+100, +100]; % UB
        varargout{4} = [pi,pi]; % solution
        varargout{5} = -1; % function value at solution (too complicated)

    % otherwise, output function value
    else

        % keep values in the serach interval
        X(X < -100) = inf;     X(X > 100) = inf;

        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        varargout{1} = -cos(x1).*cos(x2).*exp(-((x1-pi).^2 + (x2-pi).^2));

    end

end