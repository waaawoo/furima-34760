// 4242424242424242
const pay = () => {
  // Payjpのアカウントセット
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    // railsでの送信キャンセル
    e.preventDefault();
    // submit時点での情報を取得
    const formResult = document.getElementById("charge-form")
    // フォームに入っている情報を取得
    const formData = new FormData(formResult);

    // 情報を挿入
    const card = {
      number:     formData.get("buyer_history_info[number]"),
      cvc:        formData.get("buyer_history_info[cvc]"),
      exp_month:  formData.get("buyer_history_info[month]"),
      exp_year:   `20${formData.get("buyer_history_info[year]")}`
    };
    // トークン化
    Payjp.createToken(card, (status, response) => {
      if(status == 200){
        const token = response.id;
        // 正常にトークンを作れたhiddenでデータを送信
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // クレジット情報削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      // サーバーサイドへ情報を送信
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
