#include <stdio.h>


/*This implementation of the quicksort algorithm offers a sample design on how to 
  write your MIPS code.
  Note: if you want this to work for floating points, you can just change the function
  signatures and the local variables were appropriate */

void QuickSort(int arr[], int first, int last );
int Partition(int arr[], int first, int last );
void swap(int &one, int &two);
void print_arr(int arr[],int first, int last);


int main(int argc, char **argv)
{
   //Sample array to sort
    int arr[]= { 5, 3, 89, 6,54, 6, 1, 9, 28, 30, 8, 3, 57, 87,100, 64, 43, 32, 15, 82, 18, 4, 9};
    int size = sizeof(arr)/sizeof(int);
    print_arr(arr, 0, size-1);
    printf("\n");

    QuickSort(arr, 0, size-1);
   
    print_arr(arr, 0, size-1);
    printf("\n");


    return 0;
}

void QuickSort(int arr[], int first, int last )
{
    if( last < first )
        return;
    int q=Partition(arr, first, last);
    QuickSort(arr, first, q-1);
    QuickSort(arr, q+1, last);
    return;
}

int Partition(int arr[], int first, int last )
{
    int ndx= first-1;
    int pivot = arr[last];

    for(int i=first; i<=last; i++)
    {
        if(arr[i] <= pivot)
        {
            swap(arr[++ndx], arr[i] );
        }
    }

    //print_arr(arr, first, last);
    //printf("\n");

    return ndx;
}

void swap(int &one, int &two)
{
    int tmp = one;
    one = two;
    two = tmp;
    return;
}

void print_arr(int arr[],int first, int last)
{
    for(int i=first; i<=last; i++)
    {
        printf("%d ", arr[i] );
    }
}