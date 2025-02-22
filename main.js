const express = require('express')
const app = express();
const PORT = 8000;
app.get("/",(req,res)=>{
    return res.json({message : "Hey, I am in nodejs container"})
})
app.listen(PORT,()=>console.log(`seerver started on port ${PORT}`));
