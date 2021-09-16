const functions = require("firebase-functions");

exports.myFunction = function.firestore.doc('properties/{property}').onCreate((change, context)=>{
console.log(change.after.data());
})
