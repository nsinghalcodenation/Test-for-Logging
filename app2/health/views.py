from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse
from rest_framework.decorators import api_view


@api_view(['GET'])
def index(request):
    """
      Returns 200 response if server is up\n
      :return: 200 response
      """
    return HttpResponse(status=200)


# This is sample code for testing and showing mocking examples. You can comment the following
# once you are done
def sample_function2():
    return_value = "retVal"
    return return_value


def sample_function():
    retVal = sample_function2()
    return retVal