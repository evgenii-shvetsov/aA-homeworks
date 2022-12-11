import { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import User from './User';



const RandomUserTwo = () => {
  const history = useHistory();
  const [num, setNum] = useState(0);
  const [searchChange, setSearchChange] = useState('');
  const [searchWord, setSearchWord] = useState(
    localStorage.getItem('user') || 'foobar'
  );
  
  const [data, setData] = useState([]);
  const colors = ['#0c9bbd', 'red', 'orange', 'green'];

  useEffect(() => {
    const fetchUser = async () => {
      const res = await fetch(`https://randomuser.me/api/?seed=${searchWord}`);
      const data = await res.json();
      setData(data.results);
    };
    fetchUser();
  }, [searchWord]);

  useEffect(() => {
    localStorage.setItem('user', searchWord);
  }, [searchWord]);

  useEffect(() => {
    const colorInterval = setInterval(() => {
      console.log('i am running');
      setNum((prevNum) => (prevNum === 3 ? 0 : prevNum + 1));
    }, 7000);

    return ()=>clearInterval(colorInterval);
  }, []);

  return (
    <div
      style={{
        backgroundColor: colors[num],
        transition: 'background-color 4s'
      }}
      className='container'
    >
      <button onClick={() => history.push('/')}>Home</button>
      <div className='person'>
        {data?.map((data) => (
          <User key={data.id.value} data={data} />
        ))}
      </div>
      <div className='form-wrapper'>
        <form
          onSubmit={(e) => {
            e.preventDefault();
            setSearchWord(searchChange);
            setSearchChange('');
          }}
        >
          <label htmlFor='search'>Search:</label>
          <input
            id='search'
            onChange={(e) => setSearchChange(e.target.value)}
            value={searchChange}
            name='searchWord'
            placeholder='Username'
          />
          <button type='submit'>Submit</button>
        </form>
      </div>
    </div>
  );
};

export default RandomUserTwo;