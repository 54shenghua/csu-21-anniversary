# Generated by Django 3.1.4 on 2021-04-22 04:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('api', '0002_auto_20210422_1239'),
    ]

    operations = [
        migrations.CreateModel(
            name='Campus',
            fields=[
                ('campusID', models.AutoField(auto_created=True, primary_key=True, serialize=False)),
                ('campusName', models.CharField(max_length=64, null=True)),
                ('click', models.IntegerField(default=0)),
            ],
            options={
                'db_table': 'campus',
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('eventID', models.AutoField(auto_created=True, primary_key=True, serialize=False)),
                ('eventName', models.CharField(max_length=255, null=True)),
                ('click', models.IntegerField(default=0)),
            ],
            options={
                'db_table': 'event',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('openid', models.CharField(max_length=255, null=True, unique=True)),
                ('avatar', models.ImageField(null=True, upload_to='icon')),
                ('sex', models.IntegerField(default=0)),
                ('province', models.CharField(max_length=64, null=True)),
                ('city', models.CharField(max_length=64, null=True)),
                ('country', models.CharField(max_length=64, null=True)),
            ],
            options={
                'db_table': 'user',
            },
        ),
        migrations.CreateModel(
            name='Record',
            fields=[
                ('Rid', models.AutoField(primary_key=True, serialize=False)),
                ('userName', models.CharField(max_length=255, null=True)),
                ('campus', models.CharField(max_length=64, null=True)),
                ('event', models.CharField(max_length=255, null=True)),
                ('data', models.DateField()),
                ('openID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.user', to_field='openid')),
            ],
            options={
                'db_table': 'record',
            },
        ),
    ]
