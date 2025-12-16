 // Returns a JSON object with random data
 function() {
   var id = ''+ Math.floor((Math.random() * 1000) + 10); // Generates a random number between 10 and 1009
   var name = 'Dish - ' + id;
   var image = name + '.png';
   var price = '$' + Math.floor((Math.random() * 100)+1); // Generates a random number between 1 and 100
   return {
          id: id,
          name: name,
          image: image,
          price: price
   };
 }

