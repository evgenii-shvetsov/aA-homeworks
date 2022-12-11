import React from 'react'

const ContactUs = () => {
  return (
    <div>
        <h2>Contact Us</h2>
        <form>
            <div>
                <label htmlFor="name">Name:</label>
                <input type="text" id='name' />
            </div>
            <div>
                <label htmlFor="email">Email:</label>
                <input type="email" id='email' />
            </div>
            <div>
                <label htmlFor="phone">Phone:</label>
                <input type="phone" id='phone' />
            </div>
            <button>Submit</button>
        </form>
    </div>
  )
}

export default ContactUs