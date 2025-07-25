"use client"

import { useSearchParams } from "next/navigation"
import Link from "next/link"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { ArrowLeftIcon } from "lucide-react"

export default function InvoiceViewerPage() {
  const searchParams = useSearchParams()
  const invoiceNumber = searchParams.get("invoiceNumber")

  // Simula la lógica para determinar qué imagen mostrar
  const getInvoiceImagePath = (num: string | null) => {
    if (num === "123456") {
      return "/images/factura_123456.png" // Usa la imagen real que hemos añadido
    }
    // Para cualquier otro número, usa un placeholder genérico
    return `/placeholder.svg?height=256&width=384&query=digitalized invoice for ${num || "unknown"}`
  }

  const imagePath = getInvoiceImagePath(invoiceNumber)

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-100 p-4 dark:bg-gray-950">
      <Card className="w-full max-w-md">
        <CardHeader>
          <CardTitle className="text-2xl">Consulta de Imagen de Factura (Aplicación B)</CardTitle>
          <CardDescription>
            Visualización de la imagen digitalizada para la factura{" "}
            <span className="font-semibold text-primary">{invoiceNumber || "No especificado"}</span>.
          </CardDescription>
        </CardHeader>
        <CardContent className="grid gap-4">
          {invoiceNumber ? (
            <div className="space-y-4">
              <div className="relative h-64 w-full overflow-hidden rounded-md border bg-gray-200 dark:bg-gray-800">
                <img
                  src={imagePath || "/placeholder.svg"}
                  alt={`Imagen digitalizada de la factura ${invoiceNumber}`}
                  className="h-full w-full object-contain"
                />
                <div className="absolute inset-0 flex items-center justify-center text-sm text-gray-500 dark:text-gray-400">
                  {invoiceNumber ? `Imagen de Factura ${invoiceNumber}` : "No. de Factura no proporcionado"}
                </div>
              </div>
              <p className="text-sm text-muted-foreground">
                En una implementación real, esta sección cargaría la imagen de la factura desde un sistema de gestión
                documental, utilizando el número de factura como clave. Si ingresas "123456" en la App A, verás una
                imagen de ejemplo.
              </p>
            </div>
          ) : (
            <div className="text-center text-muted-foreground">
              No se ha proporcionado un número de factura para consultar.
            </div>
          )}
          <Button asChild variant="outline" className="w-full bg-transparent">
            <Link href="/invoice-capture">
              <ArrowLeftIcon className="mr-2 h-4 w-4" />
              Volver al Registro de Facturas
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
