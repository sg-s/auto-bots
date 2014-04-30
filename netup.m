% netup.m
% netup.m is a small matlab script that pings google.com to check if internet is online, and plots the round trip times. 
% 
% created by Srinivas Gorur-Shandilya at 10:20 , 09 April 2014. Contact me at http://srinivas.gs/contact/
% 
% This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/

function [] = netup(varargin)


dataroot = '/code/netup/'; % this is where the .mat files of logs of ping times are stored 
link_to_figure = '/Library/WebServer/Documents/pingtime.jpg'; % this is where you want netup to make the figure. configure a web server to pull this image and serve it in a page somewhere

if nargin == 0 
	% what happens when no inputs are supplied?

elseif iseven(nargin)
    for i = 1:nargin
        temp = varargin{i};
        if ischar(temp)
            eval(strcat(temp,'=varargin{i+1};'));
        end
    end
    
    
else
    error('Inputs need to be name value pairs')
end
	

[~,name] = getComputerName;
name = strcat(name,'.mat');


status = [];
pingtime = [];
time = [];

if exist(strcat(dataroot,name),'file')
	load(strcat(dataroot,name))
end

while 1
	pause(60)
	try
	
		% ping google.com
		[thisstatus,message]=unix('ping -c 1 google.com');
		
		if ~thisstatus
			disp('ping successful')
			a=strfind(message,'time=');
			z=strfind(message,'ms');
			thisping  = str2double(message(a+5:z(1)-2));
		else
			disp('ping failed')
			thisping =  Inf;
		end
		if isnumeric(thisping) && isnumeric(thisstatus)
			status = [status thisstatus];
			pingtime = [pingtime  thisping];
			time = [time now];
		else
			error('non numeric values!')
		end
		
	catch
	 	disp('what?')
	 	keyboard	
	end

	% save once in a while
	if rand > 0.5
		save(strcat(dataroot,name),'pingtime','status','time')
		% make a plot
		close all
		figure('outerposition',[0 0 1200 700],'PaperUnits','points','PaperSize',[1200 800]); hold on
		subplot(2,1,1)
		plot(time,pingtime,'+','LineWidth',2)
		datetick('x', 'HH:MM')
		ylabel('Ping Time (ms)','FontSize',25)
		set(gca,'LineWidth',2,'FontSize',25)
		title(strcat('Last updated:',datestr(now)),'FontSize',18)

		pstatus = status;
		pstatus(status>0) = 1;
		subplot(2,1,2), hold on
		plot(time,pstatus,'og','LineWidth',15)
		plot(time(pstatus~=0),pstatus(pstatus~=0),'xr','LineWidth',15)
		set(gcf,'PaperPositionMode','auto')
		datetick('x', 'HH:MM')
		set(gca,'LineWidth',2,'FontSize',25,'YLim',[-0.5 1.5])
		ylabel('Status','FontSize',25)



		print('-djpeg','-r300',link_to_figure)
	end





end