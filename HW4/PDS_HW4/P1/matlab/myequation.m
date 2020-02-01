clear all;
close all;
x=0:1:15;
fp=fopen('form.coe','wt');
for i=1:length(x)
    
    f(i)=x(i)*(1+sin(x(i)*pi/4))/(2+cos(x(i)*pi/4));
    fixed_number=fi(f(i),1,16,10)
    bin_number=bin(fixed_number);
    fprintf(fp,'%s,\n',bin_number);
    
end;
x=-16:1:-1;
for i=1:length(x)
    
    f(i+16)=x(i)*(1+sin(x(i)*pi/4))/(2+cos(x(i)*pi/4));
    fixed_number=fi(f(i+16),1,16,10)
    bin_number=bin(fixed_number);
    fprintf(fp,'%s,\n',bin_number);
    
end;


fclose(fp);
plot(f)
grid;