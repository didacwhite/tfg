function y = t(x1,x2)
if x1 > 0
    y = 1/(2*pi)*atan(x2/x1);
else
    y = 1/(2*pi)*atan(x2/x1) + 0.5;
end
