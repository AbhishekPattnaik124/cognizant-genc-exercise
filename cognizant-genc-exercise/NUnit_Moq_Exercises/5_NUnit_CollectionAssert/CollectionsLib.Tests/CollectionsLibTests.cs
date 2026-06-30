using NUnit.Framework;
using CollectionsLib;

namespace CollectionsLib.Tests
{
    [TestFixture]
    public class EmployeeTests
    {
        private EmployeeManager _manager;
        [SetUp]
        public void SetUp() { _manager = new EmployeeManager(); }

        [Test]
        public void GetEmployees_NoNullValues()
        {
            CollectionAssert.AllItemsAreNotNull(_manager.GetEmployees());
        }

        [Test]
        public void GetEmployees_ContainsEmployee100()
        {
            var emps = _manager.GetEmployees();
            bool contains = false;
            foreach (var emp in emps) {
                if (emp.Id == 100) contains = true;
            }
            Assert.That(contains, Is.True);
        }

        [Test]
        public void GetEmployees_UniqueEmployees()
        {
            CollectionAssert.AllItemsAreUnique(_manager.GetEmployees());
        }
    }
}