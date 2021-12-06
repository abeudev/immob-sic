<?php

declare(strict_types=1);

namespace App\Form\Type;

use App\Entity\PrisedeRDV;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

final class PriseRdvType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fullname', null, [
                'attr' => [
                    'autofocus' => true,
                    'class' => 'form-control',
                ],
                'label' => 'Nom et prénoms',
            ])
            ->add('phone', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Numéro de téléphone',
            ])
            ->add('dateRdv', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Date du rendez-vous',
            ]);
    }
}