# Create your views here.
from rest_framework.decorators import api_view, authentication_classes

from myapp import utils
from myapp.auth.authentication import AdminTokenAuthtication
from myapp.handler import APIResponse
from myapp.models import Maintainance
from myapp.permission.permission import isDemoAdminUser
from myapp.serializers import MaintainanceSerializer


@api_view(['GET'])
def list_api(request):
    if request.method == 'GET':
        maintainances = Maintainance.objects.all().order_by('-id')
        serializer = MaintainanceSerializer(maintainances, many=True)
        return APIResponse(code=0, msg='查询成功', data=serializer.data)