function [bta_rec,aha_rec] = Switch_bta_aha(bta_spe,aha_spe)
%SWITCH_BTA_AHA 此处显示有关此函数的摘要
%   此处显示详细说明

    if bta_spe == 0
        bta_rec = 1/2;
    end
    if bta_spe == 1/2
        bta_rec = 0;
    end
    if aha_spe == 0
        aha_rec = 1/2;
    end
    if aha_spe == 1/2
        aha_rec = 0;
    end
    if bta_spe == 0 && aha_spe ==0
         bta_rec = 0;
         aha_rec = 0;
    end
end

