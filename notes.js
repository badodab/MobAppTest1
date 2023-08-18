// Sales Items
// Best Seller
// Sauna Rooms
// Home Gyms
//  - multi-station home gyms
//  - smith machines
//  - functional trainers
// Matting
//  - yoga mat / exercise mat
//  - 
// Racks And Cages
// Free Weights
// Weights Machines
// Cross Training
// Cardio Machines
// Accessories
// Sports
// Camping


var cat = document.querySelector('.category-navigation-list.sticky-flyout')

function getCategories(cat) {
    if (typeof(cat) === 'string') return cat;
    var subitems = cat.querySelectorAll('.root-category-items');
    var title = cat.querySelector('a').innerText;
    if (subitems.length === 0) return title;
    var result = [];

    for (let item of subitems) {
        result.push({name: getCategories(item)});
    }
    
    return { name: title, subitems: result };
}

var result = [];

for (let item of cat.children)
{
    var data = getCategories(item);
    if (typeof (data) === 'string') { result.push({ name: data }); continue; }
    result.push(data);
}

console.log(result);
console.log(JSON.stringify(result));