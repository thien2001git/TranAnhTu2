import Instance from '../axios/Instance'

export const getVoucherByCode = (code) =>{
    const url = `/api/site/voucher/get-by-code?code=${code}`;
    return Instance.get(url);
}

export const getVouchers = (page, size) =>{
  const url = `/api/site/voucher/gel-all?page=${page}&size=${size}`;
  return Instance.get(url);
}
