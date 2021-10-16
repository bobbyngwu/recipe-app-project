from django.test import TestCase
from django.contrib.auth import get_user, get_user_model


class ModelTests(TestCase):

    def test_create_user_with_email_successful(self):
        """Test creating a new user with email is successful"""
        email = "test@waresconsult.com"
        password = "123456"
        user = get_user_model().objects.create_user(
            email = email,
            password = password
        )

        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))

    def test_create_new_superuser(self):
        """Test creating a new superuser"""
        user = get_user_model().objects.create_superuser(
            'testemail@gmail.com', 'test1234'
        )
        self.assertTrue(user.is_superuser)




