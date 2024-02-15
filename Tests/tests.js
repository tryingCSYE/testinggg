import assert from 'assert';
import request from 'supertest';
import sequelize from '../database.js'; // Adjust the import path to match your project structure
import User from '../models/users.js'; // Adjust the import path to match your project structure
import app from '../index.js'; // Adjust the import path to match your project structure

describe('/v1/user Integration Tests', function() {
  let authHeader;
  const test = {
    username: 'test@gmail.com',
    firstName: 'Kusumanth',
    lastName: 'Gali',
    password: 'Testing@123!'
  };

  before(async function() {
   await sequelize.sync({force:true});
   console.log('db synced.');
  });

  it('Test 1 - Create an account, and using the GET call, validate account exists', async function() {
    // Create a user
    const resPost = await request(app)
      .post('/v1/user')
      .send(test);
    
    assert.strictEqual(resPost.status, 201);
    assert.strictEqual(resPost.body.username, test.username);

    // Prepare the authentication header
    const credentials = Buffer.from(`${test.username}:${test.password}`).toString('base64');
    authHeader = `Basic ${credentials}`;

    // Validate the created account exists
    const getResponse = await request(app)
      .get('/v1/user/self')
      .set('Authorization', authHeader);
    
    assert.strictEqual(getResponse.status, 200);
    assert.strictEqual(getResponse.body.username, test.username);
  });

  it('Test 2 - Update the account and using the GET call, validate the account was updated', async function() {
    // Update user information
    const newTest = { firstName: 'UpdatedFirstName' };

    const updateResponse = await request(app)
      .put('/v1/user/self')
      .set('Authorization', authHeader)
      .send(newTest);
    
    assert.strictEqual(updateResponse.status, 204);

    // Validate the updated account information
    const getResponse = await request(app)
      .get('/v1/user/self')
      .set('Authorization', authHeader);
    
    assert.strictEqual(getResponse.status, 200);
    assert.strictEqual(getResponse.body.firstName, newTest.firstName);
  });

  after(async () => {
    try {
     
      await User.destroy({
        where: { username: test.username }
      });
      console.log('Test user deleted successfully.');
    } catch (error) {
      console.error('Failed to delete test user:', error);
    }
    // Close the Sequelize connection
    try {
      await sequelize.close();
      console.log('Sequelize connection closed successfully.');
    } catch (error) {
      console.error('Error closing Sequelize connection:', error);
    }
  });

});
