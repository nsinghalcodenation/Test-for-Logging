from django.test import TestCase
import mock

from health.views import sample_function

# Create your tests here.

### Following are the sample tests
### You can remove after writing your own tests

def mocked_function2():
    return "val2"

class SampleFileTest(TestCase):

    def setUp(self):
        pass

    @mock.patch("health.views.sample_function2", return_value="mockedRetVal")
    def test_sample_function(self, sample_function2_mock):
        returnValue = sample_function()
        self.assertEqual("mockedRetVal",  returnValue, "Mocking Did not happen")

    @mock.patch("health.views.sample_function2", mocked_function2)
    def test_sample_function_with_function_mock(self):
        returnValue = sample_function()
        self.assertEqual("val2", returnValue, "Mocking did not happen")