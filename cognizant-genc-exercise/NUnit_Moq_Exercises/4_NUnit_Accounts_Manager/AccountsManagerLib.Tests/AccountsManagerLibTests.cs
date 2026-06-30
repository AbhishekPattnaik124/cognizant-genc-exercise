using NUnit.Framework;
using AccountsManagerLib;
using System;

namespace AccountsManagerLib.Tests
{
    [TestFixture]
    public class AccountsManagerTests
    {
        private AccountsManager _manager;
        [SetUp]
        public void SetUp() { _manager = new AccountsManager(); }

        [Test]
        public void Login_ValidCredentials_ReturnsWelcomeMessage()
        {
            Assert.That(_manager.Login("user_11", "secret@user11"), Is.EqualTo("Welcome user_11!!!"));
        }

        [Test]
        public void Login_InvalidCredentials_ReturnsErrorMessage()
        {
            Assert.That(_manager.Login("user_11", "wrong"), Is.EqualTo("Invalid user id/password"));
        }

        [Test]
        public void Login_EmptyCredentials_ThrowsArgumentException()
        {
            Assert.Throws<ArgumentException>(() => _manager.Login("", ""));
        }
    }
}