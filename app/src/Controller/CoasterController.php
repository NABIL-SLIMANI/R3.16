<?php

namespace App\Controller;

use App\Entity\Coaster;
use App\Form\CoasterType;
use App\Repository\CoasterRepository;
use App\Repository\ParkRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Response;

class CoasterController extends AbstractController
{
    #[Route(path: "/coaster", name: "coaster_index", methods: ["GET"])]
    public function index(
        Request $request,
        CoasterRepository $repository,
        ParkRepository $parkRepository,
        CategoryRepository $categoryRepository
    ): Response {
        $parkId = $request->query->get('park', '');
        $categoryId = $request->query->get('category', '');

        $count = 20;
        $page = max(1, $request->query->getInt('p', 1));

        $coasters = $repository->findFiltered(
            $parkId,
            $categoryId,
            $count,
            $page
        );

        $pageCount = max(ceil($coasters->count() / $count), 1);

        return $this->render('coaster/index.html.twig', [
            'coasters' => $coasters,
            'parks' => $parkRepository->findAll(),
            'categories' => $categoryRepository->findAll(),
            'selectedPark' => $parkId,
            'selectedCategory' => $categoryId,
            'page' => $page,
            'pageCount' => $pageCount,
        ]);
    }

    #[Route(path: "/coaster/add", name: "coaster_add", methods: ["GET", "POST"])]
    public function add(Request $request, EntityManagerInterface $em): Response
    {
        $entity = new Coaster();
        $form = $this->createForm(CoasterType::class, $entity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($entity);
            $em->flush();

            return $this->redirectToRoute('coaster_add');
        }

        return $this->render('coaster/add.html.twig', [
            'coasterForm' => $form,
        ]);
    }

    #[Route(path: "/coaster/{id}/edit", name: "coaster_edit", methods: ["GET", "POST"])]
    public function edit(
        Coaster $coaster,
        Request $request,
        EntityManagerInterface $em
    ): Response {
        $form = $this->createForm(CoasterType::class, $coaster);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();

            return $this->redirectToRoute('coaster_index');
        }

        return $this->render('coaster/edit.html.twig', [
            'coasterForm' => $form,
        ]);
    }
}
