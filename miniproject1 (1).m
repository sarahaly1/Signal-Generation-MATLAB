disp("Welcome to signal generation program :)..")
BP = input("Enter no. of breaking points:  ");
   x= input("Enter the starting time:  ");
    l= input("Enter the ending time:  ");
    F= input("Enter the frequency:  ");
T = linspace(x,l,(l-x)*F);
Y = [];  
PS=[x  l];
ps1=[ ];
for i= 1:BP
    ps= input ("Enter the position:  ");
    ps1=[ps1  ps];
    PS=[x ps1 l];
end 
i=1;
while i<=BP+1
   
    disp("1.DC 2.Ramp 3.general 4.exponential 5.sinusoidal");
    S=input('Enter the type of the signal:  ');
    x=PS(i);
    l=PS(i+1);
     t= linspace(x,l,(l-x)*F);
    if S==1
       amp= input("Enter the amplitude:  ");
       y=zeros(1,(l-x)*F)+amp;
       
    elseif S==2
       a= input("Enter the slope:  ");
       c= input("Enter the intercepted part of y-axis:   ");
       y=a.*t+c;
       
    elseif S==3
       a= input("Enter the amplitude:  ");
       d= input("Enter the power:  ");
       c=input("Enter the intercepted part:  ");
       y=a.*(t.^d)+c;
       
    elseif S==4
       a= input("Enter the amplitude:  ");
       e= input("Enter the exponent:   ");
       y=a.*exp(e.*t);
       
    elseif S==5
       a= input("Enter the amplitude:   ");
       frq= input('Enter the frequency:  ');
       p= input("Enter the phase shift:   ");
       y=a.*sin(2*pi*frq*t+p);

    else 
       
         disp("Not identified :)....enter no. from 1 to 5:   ");
          i=i;
          continue;
        
    end   
i=i+1;
    
    Y = [Y y];

end
plot(T,Y);

 disp("1.Amplitude Scaling 2.Time Reversal 3.Time Shift 4.Expanding 5.Compressing 6.None");
 O= input("Enter the Operation:   ");
 while O>6
     disp("choose no. from 1 to 6");
      disp("1.Amplitude Scaling 2.Time Reversal 3.Time Shift 4.Expanding 5.Compressing 6.None");
     O= input("Enter the Operation:   ");
 end
 if O==1
     a=input("Enter the Amplitude:   ");
     Y=a.*Y;
     figure;
     plot(T,Y);
elseif O==2
    T=-1.*T;
    figure;
    plot(T,Y);
elseif O==3
    sh=input("Enter the Time Shift:   ");
    T=T+sh;
    figure;
    plot(T,Y);
elseif O==4
    e=input('Enter the Expanding coff.:   ');
    T=T.*e;
    figure;
    plot(T,Y);
     
elseif O==5
       e=input('Enter the Compressing coff.:  ');
     while e==0
           disp("Error division by ZERO...:) ");
           e=input('Enter the Compressing coff.:  ');

     end
           T=T./e;
           figure;
           plot(T,Y);
   else  O==6
     
 end
