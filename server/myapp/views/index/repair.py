# Create your views here.
from rest_framework.decorators import api_view, authentication_classes

from myapp import utils
from myapp.auth.authentication import AdminTokenAuthtication
from myapp.handler import APIResponse
from myapp.models import Repair
from myapp.permission.permission import isDemoAdminUser
from myapp.serializers import RepairSerializer


@api_view(['POST'])
@authentication_classes([AdminTokenAuthtication])
def create_repair(request):
    data = request.data.copy()
    serializer = RepairSerializer(data=data)
    if serializer.is_valid():
        serializer.save()
        return APIResponse(code=0, msg='预约成功', data=serializer.data)
    else:
        utils.log_error(request, '参数错误')
    return APIResponse(code=1, msg='预约失败')