

const url = window.location.search;
        const params = new URLSearchParams(url)
        const param_value = params.get("symbol")
        console.log(param_value)

        getCrypto(param_value);

        let a;

        function getCrypto(coin) {
            const xhrrequest = new XMLHttpRequest();

            xhrrequest.onload = function () {
                const resJSON = JSON.parse(xhrrequest.response);
                console.log(resJSON);
               

                
                    const main = document.createElement("div");
                    main.setAttribute("class", "main");

                    const box = document.createElement("div");
                    box.setAttribute("class", "box");
                    main.append(box);

                    const rank = document.createElement("p");
                    rank.setAttribute("id", "rank");
                    rank.innerText = "# rank" + resJSON.rank;
                    box.append(rank);

                    const top1 = document.createElement("div");
                    top1.setAttribute("class", "top")
                    box.append(top1);

                    const logo = document.createElement("img")
                    logo.setAttribute("src", "assets/Images/Logo/btc.png")
                    logo.setAttribute("width", "20%")
                    top1.append(logo)

                    const coin_name = document.createElement("h1")
                    coin_name.innerText = resJSON.name;
                    top1.append(coin_name);

                    const symbol = document.createElement("h4")
                    symbol.innerText = resJSON.symbol;
                    top1.append(symbol);

                    const check = document.createElement("input")
                    check.setAttribute("id", "check")
                    check.setAttribute("type", "checkbox")
                    top1.append(check)

                    const price_change = document.createElement("div");
                    price_change.setAttribute("class", "price_change");
                    box.append(price_change)

                    let price = document.createElement("h2");
                    price.setAttribute("id", "price");
                    price.innerHTML= `&#8377;` + Number(Math.round(resJSON.price));
                    price_change.append(price);


                    const percentage = document.createElement("h3");
                    percentage.innerText = "98 %";
                    price_change.append(percentage);

                    const value = document.createElement("div");
                    value.setAttribute("class", "value")
                    box.append(value);


                    const values = document.createElement("div");
                    values.innerHTML = ` Market cap: ${resJSON.market_cap} <br><br>
                    Total Volume 24h: ${resJSON.total_volume_24h} <br><br>
                   	△24h: ${resJSON.delta_24h} <br><br>
                `
                    value.append(values)

                    const stat = document.createElement("div")
                    stat.setAttribute("class", "stat")
                    main.append(stat);

                    const img = document.createElement("img");
                    img.setAttribute("src", "../Assets/Images/stat.png");
                    img.setAttribute("width", "80%");
                    stat.append(img);

                    const aside = document.createElement("div");
                    aside.setAttribute("class", "aside");

                    const converter = document.createElement("div");
                    converter.setAttribute("class", "converter");
                    aside.append(converter);

                    const box_h2 = document.createElement("h2");
                    box_h2.setAttribute("class", "box_h2");
                    box_h2.innerText = "Bitcoin Converter";
                    converter.append(box_h2);

                    // cardss.forEach((details) => {
                    //     if (details.user_id == login.user_id) {
                    //         det = details.coin_details;
                    //     }
                    // })

                    // let detttt
                    // det.find((data) => {
                    //     console.log(verify.value)
                    //     if (data.coin_name == verify.value.toLowerCase()) {
                    //         return detttt = data.coin_name
                    //     }
                    // })

                    // console.log(detttt)
                    const div = document.createElement("div");
                    converter.append(div);

                    const coin = document.createElement("div");
                    coin.setAttribute("class", "coin");
                    div.append(coin);

                    const input_span = document.createElement("p");
                    input_span.setAttribute("class", "input_span");
                    input_span.innerHTML = resJSON.symbol
                    coin.append(input_span);

                    let input_value = document.createElement("input");
                    input_value.setAttribute("type", "number")
                    input_value.setAttribute("class", "input_value");
                    input_value.setAttribute("id", "tag")
                    coin.append(input_value);

                    const coin2 = document.createElement("div");
                    coin2.setAttribute("class", "coin");
                    div.append(coin2);

                    const input_span2 = document.createElement("p");
                    input_span2.setAttribute("class", "input_span");
                    input_span2.innerText = "INR"
                    coin2.append(input_span2);

                    const input_value2 = document.createElement("input");
                    input_value2.setAttribute("type", "number")
                    input_value2.setAttribute("class", "input_value");
                    coin2.append(input_value2);

                    const statistics = document.createElement("div");
                    statistics.setAttribute("class", "statistics");
                    aside.append(statistics);

                    const box_h2s = document.createElement("h2");
                    box_h2s.setAttribute("class", "box_h2");
                    box_h2s.innerText = "BTC price statistics";
                    statistics.append(box_h2s);

                    const stat2 = document.createElement("div");
                    stat2.setAttribute("class", "stat2");
                    statistics.append(stat2);

                    const box2 = document.createElement("div");
                    box2.setAttribute("class", "box1");
                    stat2.append(box2);

                    for (let l = 0; l < 6; l++) {
                        const phone = document.createElement("div");
                        phone.setAttribute("class", "phone");
                        box2.append(phone);

                        const stat_data = document.createElement("p");
                        stat_data.innerText = "Bitcoin Price";
                        phone.append(stat_data);

                        const h5 = document.createElement("h5");
                        h5.innerText = "09875430987"
                        phone.append(h5);

                        const line_2 = document.createElement("hr");
                        phone.append(line_2);
                    }

                    document.querySelector(".all").append(main);
                    document.querySelector(".all").append(aside);

                    let addd = document.getElementById("tag");

                // };
            }
                xhrrequest.open(
                    "get",
                    `https://coinlib.io/api/v1/coin?key=0f699c336c04344a&pref=INR&symbol=${param_value}`,
                    true
                );
                // xhrrequest.setRequestHeader("Access-Control-Allow-Origin", "*");
                xhrrequest.send();
                gedetail()
            
        

        }
       




        function gedetail(addd) {




            addd.addEventListener("keyup", (e) => {

                console.log(a.value)
            })

        }



