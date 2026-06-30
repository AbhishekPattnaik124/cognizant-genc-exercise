using NUnit.Framework;
using UserManagerLib;
using System;

namespace UserManagerLib.Tests
{
    [TestFixture]
    public class UserManagerTests
    {
        private UserManager _manager;
        [SetUp]
        public void SetUp() { _manager = new UserManager(); }

        [Test]
        public void CreateUser_ValidPan_CreatesUser()
        {
            Assert.That(_manager.CreateUser("ABCDE1234F"), Is.True);
        }

        [Test]
        public void CreateUser_NullPan_ThrowsNullReferenceException()
        {
            Assert.Throws<NullReferenceException>(() => _manager.CreateUser(null));
        }

        [Test]
        public void CreateUser_InvalidLength_ThrowsFormatException()
        {
            Assert.Throws<FormatException>(() => _manager.CreateUser("SHORT"));
        }
    }
}