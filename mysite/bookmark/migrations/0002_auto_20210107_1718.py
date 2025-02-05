# Generated by Django 3.1.4 on 2021-01-07 08:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('bookmark', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='bookmark',
            options={'ordering': ('title',), 'verbose_name': 'bookmark', 'verbose_name_plural': 'bookmarks'},
        ),
        migrations.AddField(
            model_name='bookmark',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterModelTable(
            name='bookmark',
            table='bookmark_bookmark',
        ),
    ]
