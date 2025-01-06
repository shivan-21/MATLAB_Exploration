tspan = [0 5]; 
w0 =1; 

[t,w] = ode23(@diff_task3, tspan, w0); 
plot(t,w) ; 









function dw = diff_task3(t,w)

    dw = - w*(1.2 + sin(10*t));
end
