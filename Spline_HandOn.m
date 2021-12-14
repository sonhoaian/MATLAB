function [fHamSoCanTim] = noisuySpline(vDuLieuDocLap, vDuLieuPhuThuoc, vMocNoiSuy, nMocTraHamNoiSuy)
  sizeMatrix = length(vDuLieuDocLap);
  sizeNoiSuy = length(vMocNoiSuy);
  if(length(vDuLieuPhuThuoc) ~= sizeMatrix)
    error("Du lieu khong hop le");
    return;
  end
  
  if (issorted(vDuLieuDocLap) == 0)
    error("Du lieu doc lap chua duoc sap xep");
    return;
  end
  hesoMatrix = zeros(sizeMatrix,sizeMatrix)
  
  if nMocTraHamNoiSuy == null
    fHamSoCanTim = "";
  end
  
end

function saiso = saiso(vBienDocLap,iVitri)
  saiso = vBienDocLap(iVitri + 1) - vBienDocLap(iVitri)
end
