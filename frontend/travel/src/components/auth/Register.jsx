// Trong component Register.jsx
import React, { useState } from 'react';
import axios from 'axios'; // Thêm dòng này

const Register = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handleRegister = () => {
    axios.post('/api/register', { username, password, confirmPassword })
      .then(response => {
        console.log("Successfully")
      })
      .catch(error => {
        console.error("Error during registration:", error.response.data);
      });      
  };

  return (
    <div>
      <label>Username: </label>
      <input type="text" value={username} onChange={(e) => setUsername(e.target.value)} />
      <br />
      <label>Password: </label>
      <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
      <br />
      <label>Confirm Password: </label>
      <input type="password" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} />
      <br />
      <button onClick={handleRegister}>Register</button>
    </div>
  );
};

export default Register;
