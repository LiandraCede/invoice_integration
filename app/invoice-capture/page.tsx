"use client"

import type React from "react"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

export default function InvoiceCapturePage() {
  const router = useRouter()
  const [invoiceNumber, setInvoiceNumber] = useState("")
  const [terms, setTerms] = useState("")
  const [customerId, setCustomerId] = useState("")
  const [invoiceDate, setInvoiceDate] = useState("")
  const [amount, setAmount] = useState("")
  const [status, setStatus] = useState("")

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    // En una aplicación real, aquí se guardaría la factura en una base de datos.
    // Para esta demostración, simplemente navegamos a la aplicación B con el número de factura.
    if (invoiceNumber) {
      router.push(`/invoice-viewer?invoiceNumber=${invoiceNumber}`)
    } else {
      alert("Por favor, ingrese el número de factura.")
    }
  }

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-100 p-4 dark:bg-gray-950">
      <Card className="w-full max-w-md">
        <CardHeader>
          <CardTitle className="text-2xl">Registro de Factura (Aplicación A)</CardTitle>
          <CardDescription>Capture los datos de la factura y visualice la imagen digitalizada.</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit} className="grid gap-4">
            <div className="grid gap-2">
              <Label htmlFor="invoice-number">No. Factura</Label>
              <Input
                id="invoice-number"
                placeholder="Ej: 123456"
                value={invoiceNumber}
                onChange={(e) => setInvoiceNumber(e.target.value)}
                required
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="terms">Condiciones de Pago</Label>
              <Input
                id="terms"
                placeholder="Ej: Contado, 30 días"
                value={terms}
                onChange={(e) => setTerms(e.target.value)}
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="customer-id">ID del Cliente</Label>
              <Input
                id="customer-id"
                placeholder="Ej: CLT-00123"
                value={customerId}
                onChange={(e) => setCustomerId(e.target.value)}
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="invoice-date">Fecha de la Factura</Label>
              <Input
                id="invoice-date"
                type="date"
                value={invoiceDate}
                onChange={(e) => setInvoiceDate(e.target.value)}
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="amount">Monto Total</Label>
              <Input
                id="amount"
                type="number"
                step="0.01"
                placeholder="Ej: 12500.00"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="status">Estado</Label>
              <Select value={status} onValueChange={setStatus}>
                <SelectTrigger id="status">
                  <SelectValue placeholder="Seleccione el estado" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="pending">Pendiente</SelectItem>
                  <SelectItem value="paid">Pagada</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <Button type="submit" className="w-full">
              Registrar Factura y Ver Imagen
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
