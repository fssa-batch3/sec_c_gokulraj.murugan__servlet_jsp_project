


let card_detail = [
    {
        "title": "Crypto",
        "description": "A cryptocurrency is a cryptocurrency that has a unique name and symbol.",
        "image": "../Assets/Images/crypto.jpg",
        "link"  : "../Pages/crypto.html"

    },
    {
        "title": "Blockchain",
        "description": "A blockchain is a cryptocurrency that has a unique name and symbol.",
        "image": "../Assets/Images/block2.jpg",
        "link"  : "../Pages/blockchain.html"
    },
    {
        "title": "NFT",
        "description": "A blockchain is a cryptocurrency that has a unique name and symbol.",
        "image": "../Assets/Images/nft.jpg",
        "link"  : "../Pages/nft.html"
    },
]



for(let i = 0; i < card_detail.length ; i++) {

let card = document.createElement('div');
card.setAttribute("class","card");
document.getElementById("main").append(card)

let card_image = document.createElement('div');
card_image.setAttribute("class","card-image");
card.append(card_image)

let img = document.createElement('img');
// img.setAttribute("class","img");
img.setAttribute("src",card_detail[i]["image"]);
card_image.append(img);

let cont = document.createElement('div');
cont.setAttribute("class","cont");
card.append(cont);

let category = document.createElement('div');
category.setAttribute("class","category");
category.innerHTML  = card_detail[i]["title"]
cont.append(category);


let heading = document.createElement('div');
heading.setAttribute("class","heading");
heading.innerHTML  = card_detail[i]["description"];
cont.append(heading);


let a  = document.createElement("a");
a.setAttribute("href",card_detail[i]["link"]);
a.setAttribute("class","link");
cont.append(a)

let button = document.createElement('button');
button.setAttribute("class","button");
button.innerHTML  = "Read More";
a.append(button);

}
