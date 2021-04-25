from django.db import models

MALE = 1
FEMALE = 2
UNKNOWN = 0


# Create your models here.
class User(models.Model):
    openid = models.CharField(null=True, max_length=255, unique=True)
    avatar = models.CharField(null=True, max_length=255)
    sex = models.IntegerField(default=UNKNOWN)
    province = models.CharField(null=True, max_length=64)
    city = models.CharField(null=True, max_length=64)
    country = models.CharField(null=True, max_length=64)
    objects = models.Manager()

    class Meta:
        db_table = 'user'


class Campus(models.Model):
    campusID = models.AutoField(primary_key=True,auto_created=True,serialize=False)
    campusName = models.CharField(max_length=64, null=True)
    click = models.IntegerField(default=0)
    objects = models.Manager()

    class Meta:
        db_table = 'campus'


class Event(models.Model):
    eventID = models.AutoField(auto_created=True,primary_key=True,serialize=False)
    eventName = models.CharField(null=True, max_length=255)
    click = models.IntegerField(default=0)
    objects = models.Manager()

    class Meta:
        db_table = 'event'


class Record(models.Model):
    Rid = models.AutoField(primary_key=True)
    openID = models.ForeignKey(User, to_field='openid', on_delete=models.CASCADE)
    userName = models.CharField(max_length=255, null=True)
    campus = models.CharField(max_length=64, null=True)
    event = models.CharField(max_length=255, null=True)
    data = models.DateField()
    objects = models.Manager()

    class Meta:
        db_table = 'record'
