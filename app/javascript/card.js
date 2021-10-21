const pay = () => {
  Payjp.setPublicKey("pk_test_7c5760e6c9b1b2b4faa2758f"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

        document.getElementById("order_address_number").removeAttribute("name");
        document.getElementById("order_address_cvc").removeAttribute("name");
        document.getElementById("order_address_exp_month").removeAttribute("name");
        document.getElementById("order_address_exp_year").removeAttribute("name");
        
        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);