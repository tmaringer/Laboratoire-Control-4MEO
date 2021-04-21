f1=figure(3);
set(f1,'unit','centimeter','position',[2 1 22 15],'menubar','none','numberTitle','off','name','Identification : Control theory and applications - ECAM');

subplot(221)
plot(tm,um),grid,title('Heating power step [%] ');xlabel('Time [s]');
subplot(222);
plot(tm,ym),grid,title('Temperature [%]');xlabel('Time [s]');

global Jfull x

if isempty(x)==1;
    Ki=-10;T1i=100;T2i=10;thetai=20;
    x=[Ki,T1i,T2i,thetai];
end

x=round(x*100)/100;
x(4)=abs(x(4));

dx=2;dy=0.7;
c10=uicontrol('Visible','on','Style','text','unit','centimeter','position',[1+dx 5.2+dy 4 1.5],'string','Model coefficients :','FontSize',12);
c11=uicontrol('Visible','on','Style','text','unit','centimeter','position',[1.5+dx 4.2+dy 1 1.5],'string','Kp :','FontSize',12);
c12=uicontrol('Visible','on','Style','text','unit','centimeter','position',[1.5+dx 3.2+dy 1 1.5],'string','T1 :','FontSize',12);
c13=uicontrol('Visible','on','Style','text','unit','centimeter','position',[1.5+dx 2.2+dy 1 1.5],'string','T2 :','FontSize',12);
c14=uicontrol('Visible','on','Style','text','unit','centimeter','position',[1.5+dx 1.2+dy 1 1.5],'string','theta :','FontSize',12);

c21=uicontrol('Visible','on','Style','text','unit','centimeter','position',[2.5+dx 4.2+dy 2 1.5],'string',num2str(x(1)),'FontSize',12);
c22=uicontrol('Visible','on','Style','text','unit','centimeter','position',[2.5+dx 3.2+dy 2 1.5],'string',num2str(x(2)),'FontSize',12);
c23=uicontrol('Visible','on','Style','text','unit','centimeter','position',[2.5+dx 2.2+dy 2 1.5],'string',num2str(x(3)),'FontSize',12);
c24=uicontrol('Visible','on','Style','text','unit','centimeter','position',[2.5+dx 1.2+dy 2 1.5],'string',num2str(x(4)),'FontSize',12);

dec=10;dx=3;

c44=uicontrol('Visible','on','Style','pushbutton','unit','centimeter','position',[2.5 0.2 2 1.5],'FontSize',12,'String','Start','Callback', ...
'set(c44,''visible'',''on'');Yid=y-y0;Yid=Yid/du;Yid=Yid(tstep:end);Tid=t(tstep:end);Tid=Tid-Tid(1); Jfull=[];a=optimset(''MaxIter'',200,''MaxFunEvals'',200);[x]=fminsearch(''identification_cost_VDG'',x,a,Tid,Yid);subplot(211);title(''End optimisation '');xlabel(''Time [s]'');xi=x;set(f1,''menubar'',''figure'')');