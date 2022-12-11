import { useState } from "react";
import "./UseState.css";

const UseState = () => {
  const [theme, setTheme] = useState("state light");
  const [count, setCount] = useState(0);

  return (
    <div className={theme}>
      <h1>UseState Component</h1>
      <button onClick={() => setTheme(theme == "state dark" ? "state light": "state dark")}>Toggle theme</button>
      
      <h1>{count}</h1>
      <button onClick={()=>setCount((prevCount) => prevCount + 1)}>Increment</button>
      <button onClick={()=>setCount((prevCount) => prevCount - 1)}>Decrement</button>
    </div>
  );
};

export default UseState;
