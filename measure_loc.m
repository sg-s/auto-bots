% for every folder in /code/, 

% go see if there's a git remote, and if that repository is mine

loc_mat = 0;
loc_py = 0;
loc_cpp = 0;
loc_bash = 0;
loc_julia = 0;

all_folders = dir('/code/');
cd('/code')

for i = 1:length(all_folders)
	ok = false;
	cd('/code')

	if strcmp(all_folders(i).name(1),'.')
		continue
	end

	if ~isdir(all_folders(i).name)
		continue
	end

	if strcmp(all_folders(i).name,'config-files')
		continue
	end

	% check for a .git folder within
	if ~exist(joinPath(all_folders(i).name,'.git')) == 7
		continue
	end

	% check if it's my repo
	cd(joinPath('/code/',all_folders(i).name))
	[e,s] = system('git remote get-url origin ');

	if e == 128
		%disp('This folder has no remote:')
		%disp(all_folders(i).name)
		continue
	end

	assert(e == 0,'Error reading git remote')
	if ~any(strfind(s,'sg-s'))
		continue
	end

	disp(all_folders(i).name)

	[e,s] = system('cloc --out="temp.txt" .');

	assert(e == 0,'Error running cloc')

	lines = lineRead('temp.txt');

	% find bash line
	idx = lineFind(lines,'Shell');
	if ~isempty(idx)
		idx = idx(1);
		ok = true;
		tmp = regexp(lines{idx},'([^ ,:]*)','tokens');
		out = cat(2,tmp{:});
		n_lines = str2double(out{end});
		assert(~isnan(n_lines),'n_lines was NaN')
		loc_bash = loc_bash + n_lines;
	end

	% find MATLAB line
	idx = lineFind(lines,'MATLAB');
	if ~isempty(idx)
		ok = true;
		tmp = regexp(lines{idx},'([^ ,:]*)','tokens');
		out = cat(2,tmp{:});
		n_lines = str2double(out{end});
		assert(~isnan(n_lines),'n_lines was NaN')
		loc_mat = loc_mat + n_lines;
	end

	% find python line
	idx = lineFind(lines,'Python');
	if ~isempty(idx)
		idx = idx(1);
		ok = true;
		tmp = regexp(lines{idx},'([^ ,:]*)','tokens');
		out = cat(2,tmp{:});
		n_lines = str2double(out{end});
		assert(~isnan(n_lines),'n_lines was NaN')
		loc_py = loc_py + n_lines;
	end

	% find C++ line
	idx = lineFind(lines,'C++');
	if ~isempty(idx)
		idx = idx(1);
		ok = true;
		tmp = regexp(lines{idx},'([^ ,:]*)','tokens');
		out = cat(2,tmp{:});
		n_lines = str2double(out{end});
		assert(~isnan(n_lines),'n_lines was NaN')
		loc_cpp = loc_cpp + n_lines;
	end

	% find Julia line
	idx = lineFind(lines,'Julia');
	if ~isempty(idx)
		idx = idx(1);
		ok = true;
		tmp = regexp(lines{idx},'([^ ,:]*)','tokens');
		out = cat(2,tmp{:});
		n_lines = str2double(out{end});
		assert(~isnan(n_lines),'n_lines was NaN')
		loc_julia = loc_julia + n_lines;
	end

	if ~ok
		disp(all_folders(i).name)
	end

	delete('temp.txt')
end


figure('outerposition',[0 0 1000 500],'PaperUnits','points','PaperSize',[1000 500]); hold on
h(1) = stem(1,loc_julia);
h(2) = stem(2,loc_bash);
h(3) = stem(3,loc_py);
h(4) = stem(4,loc_cpp);
h(5) = stem(5,loc_mat);
set(gca,'cameraupvector',[1 0 0])
axis ij
X = {'Julia', 'Bash', 'Python', 'C++','MATLAB'}
set(gca,'YScale','log','XLim',[0 6],'XTick',[1:5],'XAxisLocation','top','XTickLabel',X,'YMinorTick','on')
ylabel('Lines of code')
prettyFig;

for i = 1:length(h)
	h(i).LineWidth = 6;
	h(i).MarkerSize = 30;
	h(i).MarkerFaceColor = h(i).Color;
end

