[filename, filepath] = uigetfile('*.fig');
if ~ischar(filename)
    error('cancel');
end

fullname = fullfile(filepath, filename);
fig = openfig(fullname);

dataObjsY = findobj(fig,'-property','YData');
for i=1:length(dataObjsY)
   var_name = "y" + num2str(i);
   assignin('base', var_name, dataObjsY(i).YData)  
end

dataObjsX = findobj(fig,'-property','XData');
for i=1:length(dataObjsX)
   var_name = "x" + num2str(i);
   assignin('base', var_name, dataObjsX(i).YData)  
end