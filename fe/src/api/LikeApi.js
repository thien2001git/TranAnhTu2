import Instance from '../axios/Instance'

export const like = (user_id, product_id) =>{
    const url = `/api/site/like/add`;
    return Instance.post(url, {
        user_id: user_id,
        product_id: product_id,
    });
}

export const count = (product_id) =>{
  const url = `/api/site/like/count`;
  return Instance.post(url, {
    user_id: "",
    product_id: product_id,
  });
}

export const removeLike = (user_id, product_id) =>{
    const url = `/api/site/like/rm`;
    return Instance.post(url, {
        user_id: user_id,
        product_id: product_id,
    });
}

export const checkLike = (user_id, product_id) =>{
    const url = `/api/site/like/check`;
    const data = {
        user_id: user_id,
        product_id: product_id,
    };
    console.log(data)
    return Instance.post(url, data);
}