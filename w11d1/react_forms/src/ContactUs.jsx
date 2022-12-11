import React from 'react'
import { useState } from 'react'

const ContactUs = () => {

    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [phone, setPhone] = useState('');

    const onSubmit = (e) =>{
        e.preventDefault();

        const contactUsInformation = {
            name,
            email,
            phone,
            submittedOn: new Date()
          };

        console.log(contactUsInformation);

        setName('');
        setEmail('');
        setPhone('');
    }

  return (
    <div>
        <h2>Contact Us</h2>
        <form onSubmit={onSubmit}>
            <div>
                <label htmlFor="name">Name:</label>
                <input type="text" id='name' value={name} onChange={e=>setName(e.target.value)} />
            </div>
            <div>
                <label htmlFor="email">Email:</label>
                <input type="email" id='email' value={email} onChange={e=>setEmail(e.target.value)} />
            </div>
            <div>
                <label htmlFor="phone">Phone:</label>
                <input type="phone" id='phone' value={phone} onChange={e=>setPhone(e.target.value)}/>
            </div>
            <button>Submit</button>
        </form>
    </div>
  )
}

export default ContactUs