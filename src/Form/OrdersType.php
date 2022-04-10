<?php

namespace App\Form;

use App\Entity\Orders;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OrdersType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('ProductName')
            ->add('ProductRefNo')
            ->add('price')
            ->add('size')
            ->add('color')
            ->add('quantity')
            ->add('deliveryMethod')
            ->add('firstName')
            ->add('lastName')
            ->add('email')
            ->add('phoneNo')
            ->add('address')
            ->add('postCode')
            ->add('city')
            // ->add('createdAt')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Orders::class,
        ]);
    }
}
