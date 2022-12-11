import React from 'react'
import { useState, useEffect } from 'react'

const ContactUs = () => {

    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [phone, setPhone] = useState('');
    const [comments, setComments] = useState('');
    const [phoneType, setPhoneType] = useState('');
    const [validationErrors, setValidationErrors] = useState([]);
    const [hasSubmitted, setHasSubmitted] = useState(false);

    useEffect(()=>{
        const errors = [];
        if(!name.length){
            errors.push('Please enter your Name')
        }
        if(!email.includes('@')){
            errors.push('Please provide a valid Email')
        }
        setValidationErrors(errors);
    },[name, email])

    const onSubmit = (e) =>{
        e.preventDefault();

        setHasSubmitted(true);
        if(validationErrors.length) return alert('Cannot Submit');

        const contactUsInformation = {
            name,
            email,
            phone,
            comments,
            phoneType,
            submittedOn: new Date()
          };

        console.log(contactUsInformation);

        setName('');
        setEmail('');
        setPhone('');
        setComments('');
        setPhoneType('');
        setValidationErrors([]);
        setHasSubmitted(false);

    }

  return (
    <div>
        <h2>Contact Us</h2>

        {hasSubmitted && validationErrors.length > 0 && (
        <div>
          The following errors were found:
          <ul>
            {validationErrors.map(error => (
              <li key={error}>{error}</li>
            ))}
          </ul>
        </div>
      )}

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
                <input name='phone' type="text" id='phone' value={phone} onChange={e=>setPhone(e.target.value) }/>
                
                <select name="phoneType" value={phoneType} onChange={e=>setPhoneType(e.target.value)}>
                    <option value="" disabled>
                        Select a phone type...
                    </option>
                    <option>Home</option>
                    <option>Work</option>
                    <option>Mobile</option>
                </select>
            </div>

            <div>
                <label htmlFor="comments">Comments:</label>
                <textarea name="comments" id="comments" value={comments} onChange={e=> setComments(e.target.value)}></textarea>
            </div>


            <button>Submit</button>
        </form>
    </div>
  )
}

export default ContactUs