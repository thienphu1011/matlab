function [d, m, s] = convertDDtoDMS(dd)
    is_neg = dd < 0; 
    dd = abs(dd);
    d = floor(dd); 
    m_float = (dd - d) * 60; 
    m = floor(m_float); 
    s = (m_float - m) * 60; 
    if is_neg
        d = -d;
    end
end