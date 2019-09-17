function [X,y] = ProcessData (filename, fn, head)
  raw = textread(filename,"%s");
  raw = char(raw);
  if(head)
    raw = raw(2:end,:);
  endif
  
  m = size(raw,1);
  X = zeros(m,fn + 1);
  y = zeros(m,1);
  
  c = cell(m,fn + 1);
  
  % Split data into cell
  for i = 1:m
    c(i,:) = strsplit(raw(i,:),";");      
  end
  
  
  for i = 1:fn+1
    if(!isnan(str2double(c{1,i})))      
      for j = 1:m
        X(j,i) = str2double(c{j,i});
      end
      continue;
    end
    idx = 0;
    map = containers.Map();
    for j = 1:m      
      str = c{j,i};
      if(isKey(map,str))
        X(j,i) = map(str);        
      else
        map(str) = idx;
        X(j,i) = idx;
        idx++;      
      end
    end    
  end
  y = X(:,fn+1);
  X = X(:,1:fn);
  
  

endfunction
