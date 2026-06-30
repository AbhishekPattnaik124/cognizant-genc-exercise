using NUnit.Framework;
using Moq;
using PlayersManagerLib;
using System;

namespace PlayerManager.Tests
{
    [TestFixture]
    public class PlayerTests
    {
        private Mock<IPlayerMapper> _mockPlayerMapper;

        [OneTimeSetUp]
        public void Init()
        {
            _mockPlayerMapper = new Mock<IPlayerMapper>();
            // Return false for IsPlayerNameExistsInDb to simulate new player
            _mockPlayerMapper.Setup(m => m.IsPlayerNameExistsInDb(It.IsAny<string>())).Returns(false);
            _mockPlayerMapper.Setup(m => m.AddNewPlayerIntoDb(It.IsAny<string>()));
        }

        [Test]
        public void RegisterNewPlayer_WhenCalledWithValidName_ReturnsPlayerWithCorrectAttributes()
        {
            // Act
            Player result = Player.RegisterNewPlayer("John Doe", _mockPlayerMapper.Object);

            // Assert
            Assert.That(result, Is.Not.Null);
            Assert.That(result.Name, Is.EqualTo("John Doe"));
            Assert.That(result.Age, Is.EqualTo(23));
            Assert.That(result.Country, Is.EqualTo("India"));
            Assert.That(result.NoOfMatches, Is.EqualTo(30));
        }

        [Test]
        public void RegisterNewPlayer_WhenNameIsEmpty_ThrowsArgumentException()
        {
            // Assert
            Assert.Throws<ArgumentException>(() => Player.RegisterNewPlayer("", _mockPlayerMapper.Object));
        }

        [Test]
        public void RegisterNewPlayer_WhenNameAlreadyExists_ThrowsArgumentException()
        {
            // Arrange - Create a specific mock for this test
            var mockMapper = new Mock<IPlayerMapper>();
            mockMapper.Setup(m => m.IsPlayerNameExistsInDb(It.IsAny<string>())).Returns(true);

            // Assert
            var ex = Assert.Throws<ArgumentException>(() => Player.RegisterNewPlayer("ExistingName", mockMapper.Object));
            Assert.That(ex.Message, Is.EqualTo("Player name already exists."));
        }
    }
}
