[filename, filepath] = uigetfile('*.fig');
if ~ischar(filename)
    error('cancel');
end

fullname = fullfile(filepath, filename);
fig = openfig(fullname);

dataObjsX = findobj(fig,'-property','XData');
for i=1:length(dataObjsX)
   var_name = "x" + num2str(i);
   assignin('base', var_name, dataObjsX(i).XData)  
end

dataObjsY = findobj(fig,'-property','YData');
for i=1:length(dataObjsY)
   var_name = "y" + num2str(i);
   assignin('base', var_name, dataObjsY(i).YData)  
end

% 3D support figures
dataObjsZ = findobj(fig,'-property','ZData');
if ~isempty(dataObjsZ(1).ZData)
    for i=1:length(dataObjsZ)
       var_name = "z" + num2str(i);
       assignin('base', var_name, dataObjsZ(i).ZData)  
    end
end

