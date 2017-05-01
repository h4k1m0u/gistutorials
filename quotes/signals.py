from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Member, Quote
from django.utils.text import slugify
import tweepy
from django.urls import reverse
from django.conf import settings


@receiver(post_save, sender=User)
def create_member(sender, instance, created, **kwargs):
    """
        Create member (user, slug) when the user (contrib.auth) is created.
    """
    if created:
        Member.objects.create(slug=slugify(instance.username), user=instance)


@receiver(post_save, sender=Quote)
def tweet_quote(sender, instance, created, **kwargs):
    """
        Tweet a quote when it is created and published.
    """
    if created and instance.published:
        # bookquotes twitter app credentials
        consumer_key = 'WIjmRBgixAOxURx5BkaixMDM0'
        consumer_secret = '4xRw9KPFmxyFa07tq5FDgStYPQv3wvKppiXRtlsVVovgs3MWMw'
        access_token = '856220929176858624-KAshTClUSnaR4lzVnt9kqUuucZ3I2v1'
        access_token_secret = 'Fi1bItVvCMeV17Itju89twS29dCHhr8HUvnbjUIAEdCK3'

        # authenticate with bookquotes twitter app
        auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
        auth.set_access_token(access_token, access_token_secret)
        api = tweepy.API(auth)

        # tweet quote's text
        api.update_status(
            status=instance.text + ' ' +
            settings.BASE_URL +
            reverse('quotes:quote-detail', kwargs={'pk': instance.id,
                                                   'slug': instance.slug})
        )
