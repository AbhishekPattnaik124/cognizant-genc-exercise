using NUnit.Framework;
using Moq;
using MagicFilesLib;
using System.Collections.Generic;

namespace DirectoryExplorer.Tests
{
    [TestFixture]
    public class DirectoryExplorerTests
    {
        private Mock<IDirectoryExplorer> _mockDirectoryExplorer;
        private readonly string _file1 = "file.txt";
        private readonly string _file2 = "file2.txt";

        [OneTimeSetUp]
        public void Init()
        {
            _mockDirectoryExplorer = new Mock<IDirectoryExplorer>();
            // Configure mock object to return hardcoded list of files
            _mockDirectoryExplorer.Setup(m => m.GetFiles(It.IsAny<string>()))
                                  .Returns(new List<string> { _file1, _file2 });
        }

        [Test]
        public void GetFiles_WhenCalled_ReturnsValidCollection()
        {
            // Act
            ICollection<string> result = _mockDirectoryExplorer.Object.GetFiles("dummy_path");

            // Assert
            Assert.That(result, Is.Not.Null);
            Assert.That(result.Count, Is.EqualTo(2));
            Assert.That(result, Does.Contain(_file1));
        }
    }
}
